module SHOP
  module V1
    class Products < Grape::API
      namespace :departments do
        params do
          requires :department_id, type: Integer, desc: 'Department identifier'
        end

        route_param :department_id do
          namespace :products do
            desc 'Get products for department'
            get do
              data = declared(params)
              Department.find(data[:department_id]).products
            end

            params do
              requires :id, type: Integer, desc: 'Product identifier'
            end
            route_param :id, requirements: { id: /[0-9]*/ } do
              desc 'Show product'
              get do
                data = declared(params)
                Department.find(data[:department_id]).products.find(data[:id])
              end
            end
          end
        end
      end

      resource :products do
        desc 'Show all products'
        get do
          Product.all
        end
        
        route_param :id, requirements: { id: /[0-9]*/ } do
          desc 'Show product'
          get do
            Product.find(params[:id])
          end
        end
      end
    end
  end
end
