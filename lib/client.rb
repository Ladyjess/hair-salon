class Client

  attr_reader(:description,:stylist_id, :appointment_date)

  define_method(:initialize) do |attributes|
  @description = attributes[:description]
  @stylist_id = attributes[:list_id]
  @appointment_date = attributes[:appointment_date]
 end
end
