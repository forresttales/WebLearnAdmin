Tabulous.setup do

  tabs do

    tablets_tab do
      text          { 'Tablets' }
      link_path     { tablets_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('tablets') }
    end

    tab1lets_tab do
      text          { 'Tablets 1' }
      link_path     { tab1lets_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('tab1lets') }
    end

    tab2lets_tab do
      text          { 'Tablets 2' }
      link_path     { tab2lets_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('tab2lets') }
    end

    tab3lets_tab do
      text          { 'Tablets 3' }
      link_path     { tab3lets_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('tab3lets') }
    end

    tab4lets_tab do
      text          { 'Tablets 4' }
      link_path     { tab4lets_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('tab4lets') }
    end

    # admin_reg_communs_tab do
      # text          { 'Admin Reg Communs' }
      # link_path     { admin_reg_communs_path }
      # visible_when  { true }
      # enabled_when  { true }
      # active_when   { in_action('any').of_controller('admin_reg_communs') }
    # end
# 
    # admin_reg_letters_tab do
      # text          { 'Admin Reg Letters' }
      # link_path     { admin_reg_letters_path }
      # visible_when  { true }
      # enabled_when  { true }
      # active_when   { in_action('any').of_controller('admin_reg_letters') }
    # end
# 
    # admin_landings_tab do
      # text          { 'Admin Landings' }
      # link_path     { admin_landings_path }
      # visible_when  { true }
      # enabled_when  { true }
      # active_when   { in_action('any').of_controller('admin_landings') }
    # end
# 
    # admin_contacts_tab do
      # text          { 'Admin Contacts' }
      # link_path     { admin_contacts_path }
      # visible_when  { true }
      # enabled_when  { true }
      # active_when   { in_action('any').of_controller('admin_contacts') }
    # end
# 
    # students_tab do
      # text          { 'Students' }
      # link_path     { students_path }
      # visible_when  { true }
      # enabled_when  { true }
      # active_when   { in_action('any').of_controller('students') }
    # end
# 
    # teachers_tab do
      # text          { 'Teachers' }
      # link_path     { teachers_path }
      # visible_when  { true }
      # enabled_when  { true }
      # active_when   { in_action('any').of_controller('teachers') }
    # end
# 
    # static_pages_tab do
      # text          { 'Static Pages' }
      # link_path     { index_path }
      # visible_when  { true }
      # enabled_when  { true }
      # active_when   { in_action('any').of_controller('static_pages') }
    # end
# 
    # friendly_id_slugs_tab do
      # text          { 'Friendly Id Slugs' }
      # link_path     { friendly_id_slugs_index_path }
      # visible_when  { true }
      # enabled_when  { true }
      # active_when   { in_action('any').of_controller('friendly_id_slugs') }
    # end
# 
    # share_files_tab do
      # text          { 'Share Files' }
      # link_path     { share_path }
      # visible_when  { true }
      # enabled_when  { true }
      # active_when   { in_action('any').of_controller('share_files') }
    # end
# 
    # uploads_tab do
      # text          { 'Uploads' }
      # link_path     { uploads_index_path }
      # visible_when  { true }
      # enabled_when  { true }
      # active_when   { in_action('any').of_controller('uploads') }
    # end
# 
    # swings_tab do
      # text          { 'Swings' }
      # link_path     { swings_index_path }
      # visible_when  { true }
      # enabled_when  { true }
      # active_when   { in_action('any').of_controller('swings') }
    # end
# 
    # admin_user_profiles_tab do
      # text          { 'Admin User Profiles' }
      # link_path     { admin_user_profiles_path }
      # visible_when  { true }
      # enabled_when  { true }
      # active_when   { in_action('any').of_controller('admin_user_profiles') }
    # end
# 
    # admin_reg_events_tab do
      # text          { 'Admin Reg Events' }
      # link_path     { admin_reg_events_path }
      # visible_when  { true }
      # enabled_when  { true }
      # active_when   { in_action('any').of_controller('admin_reg_events') }
    # end
# 
    # admins_tab do
      # text          { 'Admins' }
      # link_path     { admins_index_path }
      # visible_when  { true }
      # enabled_when  { true }
      # active_when   { in_action('any').of_controller('admins') }
    # end
# 
    # admin_registers_tab do
      # text          { 'Admin Registers' }
      # link_path     { admin_registers_index_path }
      # visible_when  { true }
      # enabled_when  { true }
      # active_when   { in_action('any').of_controller('admin_registers') }
    # end
# 
    # admin_publishers_tab do
      # text          { 'Admin Publishers' }
      # link_path     { admin_publishers_index_path }
      # visible_when  { true }
      # enabled_when  { true }
      # active_when   { in_action('any').of_controller('admin_publishers') }
    # end
# 
    # admin_institutes_tab do
      # text          { 'Admin Institutes' }
      # link_path     { admin_institutes_index_path }
      # visible_when  { true }
      # enabled_when  { true }
      # active_when   { in_action('any').of_controller('admin_institutes') }
    # end
# 
    # edmatchups_tab do
      # text          { 'Edmatchups' }
      # link_path     { edmatchups_path }
      # visible_when  { true }
      # enabled_when  { true }
      # active_when   { in_action('any').of_controller('edmatchups') }
    # end
# 
    # user_publishers_tab do
      # text          { 'User Publishers' }
      # link_path     { user_publishers_index_path }
      # visible_when  { true }
      # enabled_when  { true }
      # active_when   { in_action('any').of_controller('user_publishers') }
    # end
# 
    # users_tab do
      # text          { 'Users' }
      # link_path     { users_path }
      # visible_when  { true }
      # enabled_when  { true }
      # active_when   { in_action('any').of_controller('users') }
    # end
# 
    # access_tab do
      # text          { 'Access' }
      # link_path     { access_index_path }
      # visible_when  { true }
      # enabled_when  { true }
      # active_when   { in_action('any').of_controller('access') }
    # end
# 
    # contacts_tab do
      # text          { 'Contacts' }
      # link_path     { contacts_path }
      # visible_when  { true }
      # enabled_when  { true }
      # active_when   { in_action('any').of_controller('contacts') }
    # end
# 
    # logout_tab do
      # text          { 'Logout' }
      # link_path     { logout_index_path }
      # visible_when  { true }
      # enabled_when  { true }
      # active_when   { in_action('any').of_controller('logout') }
    # end

  end

  customize do

    # which class to use to generate HTML
    # :default, :html5, :bootstrap, or :bootstrap_pill
    # or create your own renderer class and reference it here
    # renderer :default

    # whether to allow the active tab to be clicked
    # defaults to true
    # active_tab_clickable true

    # what to do when there is no active tab for the current controller action
    # :render -- draw the tabset, even though no tab is active
    # :do_not_render -- do not draw the tabset
    # :raise_error -- raise an error
    # defaults to :do_not_render
    # when_action_has_no_tab :do_not_render

    # whether to always add the HTML markup for subtabs, even if empty
    # defaults to false
    # render_subtabs_when_empty false

  end

  # The following will insert some CSS straight into your HTML so that you
  # can quickly prototype an app with halfway-decent looking tabs.
  #
  # This scaffolding should be turned off and replaced by your own custom
  # CSS before using tabulous in production.
  use_css_scaffolding do
    background_color '#ccc'
    text_color '#444'
    active_tab_color '#fff'
    hover_tab_color '#ddd'
    inactive_tab_color '#aaa'
    inactive_text_color '#888'
  end

end
