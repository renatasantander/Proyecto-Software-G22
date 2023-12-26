require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @producto = productos(:producto1)
  end
    
  test "should get new" do
    get new_producto_review_path(@producto.id)
    assert_response :success
  end

end
