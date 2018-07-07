ActiveAdmin.register MeetingRoom do

permit_params :name, :device_id, :status


  form title: 'Create Meeting Room' do |f|
    f.inputs "Meeting Room's Details" do
      f.input :name
      f.input :device_id, as: :select, collection: Device.pluck(:hwid, :id).uniq, include_blank: true
      f.input :status, as: :select, collection: ['Vacant', 'Occupied']
    end
    actions
  end


  show do |cs|
    columns do
      column do
        attributes_table do
          row :name
          row :device_id
        end
      end
      column do
        attributes_table do
          row :status
          row :updated_at
        end
      end
    end

    columns do
      column do
        panel "User's Redeem" do
          table_for meeting_room.reservations do
            column :topic
            column :from
            column :to
            column :created_at
            column :updated_at
          end
        end
      end
    end
  end

end
