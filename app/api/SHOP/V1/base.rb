module SHOP
  module V1
    class Base < Grape::API
      mount SHOP::V1::Departments
      mount SHOP::V1::Products
    end
  end
end
