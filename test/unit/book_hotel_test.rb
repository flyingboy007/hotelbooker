require "test_helper"
require "hotelbooker/services/book_hotel"

module Hotelbooker
  class BookHotelTest < MiniTest::Test
    def test_books_an_hotel_room
      #setup
      @hotel=create(:hotel_with_extras, name: "Sheraton NY")
      @extras=@hotel.extras
      @data= {
          name: "Abhilash",
          credit_card_number: "0000 0000 0000 0000",
          credit_card_expires_at: {
              year: 2017,
              month: 05
          }
      }
      @date= Time.new(2014, 12, 31)

      #operation
      service=BookHotel.new(@hotel, @extras, @data,  @date)
      service.execute

      #assertions
      assert_kind_of Booking, service.booking
    end
  end
end