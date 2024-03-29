require File.dirname(__FILE__) + '/../test_helper'
require 'response_controller'

class ResponseControllerTest < ActionController::TestCase
    fixtures :team_roles
    fixtures :responses
    fixtures :response_maps
    fixtures :users
    fixtures :assignments
    fixtures :questions
    fixtures :participants
    fixtures :questionnaires
    fixtures :team_role_assignments
    fixtures :team_member_roles

    def test_team_role_info
       assert_not_nil(team_roles(:team_role1).id)
    end

    def test_response_new
       t = TeammateReviewResponseMap.find(:first, :conditions=> ["reviewee_id = ? and reviewer_id = ? and  reviewed_object_id = ?", participants(:par17).id, participants(:par18).id,assignments(:assignment_oss).id])
       rt = response_maps(:response_maps10).id
       role = team_roles(:team_role1).id
       u = users(:student3).id

       assert_not_nil(t)
       assert_not_nil(rt)
       assert_not_nil(role)
       assert_not_nil(u)
    end

    def test_role_collection
      role_coll = TeamRole.all
     role_coll.each do |x|
       assert_valid x
     end
    end


end