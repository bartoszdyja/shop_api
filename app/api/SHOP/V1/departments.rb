module SHOP
  module V1
    class Departments < Grape::API
      resource :departments do
        desc 'Return list of departments'
        get do
          Department.all
        end

        desc 'Create department'
        params do
          requires :data, type: Hash do
            requires :attributes, type: Hash do
              requires :name, type: String, desc: 'Name'
            end
          end
        end
        post do
          data = declared(params)
          Department.create(data[:data][:attributes])
        end

        desc 'Show department'
        params do
          requires :id, type: Integer, desc: 'Department ID'
        end
        route_param :id do
          get do
            Department.find(params[:id])
          end
        end

      end
    end
  end
end
