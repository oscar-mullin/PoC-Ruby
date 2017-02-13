Feature: Site Editor

  Scenario Outline: ENG-11821 - Site Editor - Verify that a different brand color can be selected and it is applied throughout the site
    Given I login to "<site>" community with "<user>" user
    And I click on 'Administration' main menu tab
    When I click on 'Theme Editor' option on 'Administration' page
    Then I verify the 'Save' button is disabled on 'Theme Editor' page
    When I click on the 'Brand Color' circle
    Then I verify the color picker is displayed
    When I fill in the Hex color field with "<hex_code>" code
    Then I verify Hex color field value is "<hex_code>"
    And I verify the 'Save' button is enabled on 'Theme Editor' page
    When I click on the 'Save' button on 'Theme Editor' page
    And I verify "Saved" popup message is displayed on 'Theme Editor' page
    When I click on 'View Ideas' main menu tab
    And I click on the "<idea_title>" idea on 'View Ideas' page
    Then I verify the idea's rating has "<hex_code>" color
    When I click on 'Home' main menu tab
    Then I verify the navigation bar has "<hex_code>" color
    And I verify the 'Ideas' tab has "<hex_code>" color
    When I click on 'Post Idea' main menu tab
    Then I verify 'Publish' button has "<hex_code>" color
  @non-challenge
  Examples:
    | site                                      | user      | hex_code  | idea_title                    |
    | Non-Challenge community - Admin Settings  | autobot5  | 32c700    | Community Idea AS-011 Votes 1 |
  @Test
  Scenario Outline: ENG-10487 - Verify that some widgets are no longer listed in the 'Select Widget' dropdown on the Site Editor page
    Given I login to "<site>" community with "<user>" user
    When I click on "Administration" main menu tab
    And I click on "Site Editor" option
    And I click on the "Home" link
    And I select "Content" tab
    And I expand the first "Select Widget" dropdown
    Then I verify that 'approval_task' widget is not displayed
    And I verify that 'blog_tags' widget is not displayed
    And I verify that 'bookmarked_ideas_widget' widget is not displayed
    And I verify that 'buddy_edit' widget is not displayed
    And I verify that 'change_ownership' widget is not displayed
    And I verify that 'clone_idea' widget is not displayed
    And I verify that 'close_idea' widget is not displayed
    And I verify that 'colors_and_logo' widget is not displayed
    And I verify that 'comment_edit' widget is not displayed
    And I verify that 'constituent_idea_list' widget is not displayed
    And I verify that 'control_panel' widget is not displayed
    And I verify that 'create_task' widget is not displayed
    And I verify that 'dfv_encash_currency' widget is not displayed
    And I verify that 'dfv_highest_funds_raised' widget is not displayed
    And I verify that 'dfv_view_cart' widget is not displayed
    And I verify that 'display_content_title' widget is not displayed
    And I verify that 'email_experts_fresh' widget is not displayed
    And I verify that 'email_idea_members' widget is not displayed
    And I verify that 'email_users' widget is not displayed
    And I verify that 'evaluation_file_task' widget is not displayed
    And I verify that 'expert_approvals' widget is not displayed
    And I verify that 'expert_approval_detail' widget is not displayed
    And I verify that 'firsttime_splash_screen' widget is not displayed
    And I verify that 'graduation_thresholds' widget is not displayed
    And I verify that 'idea_breadcrumb' widget is not displayed
    And I verify that 'idea_vote_comments' widget is not displayed
    And I verify that 'ideas_on_map_widget' widget is not displayed
    And I verify that 'iframe_widget' widget is not displayed
    And I verify that 'import_no_dnd' widget is not displayed
    And I verify that 'interest_rating' widget is not displayed
    And I verify that 'member_info1_widget' widget is not displayed
    And I verify that 'member_info2_widget' widget is not displayed
    And I verify that 'members_viewing' widget is not displayed
    And I verify that 'menubar_links' widget is not displayed
    And I verify that 'mobile_app_settings' widget is not displayed
    And I verify that 'mobile_category_list' widget is not displayed
    And I verify that 'mobile_emailfriend' widget is not displayed
    And I verify that 'mobile_fitler' widget is not displayed
    And I verify that 'mobile_filterresults' widget is not displayed
    And I verify that 'mobile_help' widget is not displayed
    And I verify that 'mobile_list_communities' widget is not displayed
    And I verify that 'mobile_post_idea' widget is not displayed
    And I verify that 'mobile_review_details' widget is not displayed
    And I verify that 'mobile_review_idea' widget is not displayed
    And I verify that 'mobile_search' widget is not displayed
    And I verify that 'mobile_searchresults' widget is not displayed
    And I verify that 'mobile_support' widget is not displayed
    And I verify that 'mobile_terms' widget is not displayed
    And I verify that 'mobile_user_list' widget is not displayed
    And I verify that 'mobile_user_profile' widget is not displayed
    And I verify that 'mobile_view_idea' widget is not displayed
    And I verify that 'mobile_widget' widget is not displayed
    And I verify that 'myactivities' widget is not displayed
    And I verify that 'myfollowings' widget is not displayed
    And I verify that 'names' widget is not displayed
    And I verify that 'open_tasks' widget is not displayed
    And I verify that 'post_idea' widget is not displayed
    And I verify that 'post_text_task' widget is not displayed
    And I verify that 'rankings_redirect' widget is not displayed
    And I verify that 'review_task' widget is not displayed
    And I verify that 'report_abuse' widget is not displayed
    And I verify that 'reset_user' widget is not displayed
    And I verify that 'rss_header' widget is not displayed
    And I verify that 'screen_name_widget' widget is not displayed
    And I verify that 'sector_tabs' widget is not displayed
    And I verify that 'sectorshome_body' widget is not displayed
    And I verify that 'sectorshome_participate' widget is not displayed
    And I verify that 'show_survey' widget is not displayed
    And I verify that 'similar_ideas_tfidf' widget is not displayed
    And I verify that 'task_scorecard' widget is not displayed
    And I verify that 'tell_a_friend' widget is not displayed
    And I verify that 'top_ranked_ideas_if' widget is not displayed
    And I verify that 'update_content' widget is not displayed
    And I verify that 'user' widget is not displayed
    And I verify that 'user_admin' widget is not displayed
    And I verify that 'user_profile_mini' widget is not displayed
    And I verify that 'usertestimonial' widget is not displayed
    And I verify that 'version_info' widget is not displayed
    And I verify that 'view_cart' widget is not displayed
    And I verify that 'view_idea' widget is not displayed
    And I verify that 'view_ideas' widget is not displayed
    And I verify that 'view_sector' widget is not displayed

  Examples:
    | site                                  | user  |
    | Main Site                             | admin |
    | Non-Challenge community - Site Editor | admin |
    | Challenge community - Site Editor     | admin |
