require 'test_helper'

class ParticipantsControllerTest < ActionController::TestCase
  setup do
    @participant = participants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:participants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create participant" do
    assert_difference('Participant.count') do
      post :create, participant: { address: @participant.address, cpu: @participant.cpu, email: @participant.email, extra: @participant.extra, ip: @participant.ip, key: @participant.key, name: @participant.name, phone: @participant.phone, products: @participant.products }
    end

    assert_redirected_to participant_path(assigns(:participant))
  end

  test "should show participant" do
    get :show, id: @participant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @participant
    assert_response :success
  end

  test "should update participant" do
    patch :update, id: @participant, participant: { address: @participant.address, cpu: @participant.cpu, email: @participant.email, extra: @participant.extra, ip: @participant.ip, key: @participant.key, name: @participant.name, phone: @participant.phone, products: @participant.products }
    assert_redirected_to participant_path(assigns(:participant))
  end

  test "should destroy participant" do
    assert_difference('Participant.count', -1) do
      delete :destroy, id: @participant
    end

    assert_redirected_to participants_path
  end
end
