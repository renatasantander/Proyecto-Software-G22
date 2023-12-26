require "test_helper"

class ProductosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @producto = productos(:producto1)
  end

  test "should get new" do
    get new_producto_path
    assert_response :success
  end


  test "should get index" do
    get productos_path
    assert_response :success
  end

  test "should show producto" do
    get producto_path(@producto)
    assert_response :success
  end

  test "should get edit" do
    get edit_producto_path(@producto)
    assert_response :success
  end

  test "should update producto" do
    patch producto_path(@producto), params: { producto: { nombre: "Nombre actualizado" } }
    assert_redirected_to producto_path(@producto)
    @producto.reload
    assert_equal "Nombre actualizado", @producto.nombre
  end

  test "should destroy producto" do
    assert_difference("Producto.count", -1) do
      delete producto_path(@producto)
    end

    assert_redirected_to productos_path
  end
end
