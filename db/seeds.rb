User.destroy_all
Document.destroy_all
Revision.destroy_all

u1 = User.create(:username => 'whyte', :avatar => 'http://th07.deviantart.net/fs71/PRE/i/2011/317/a/7/night_elf_druid_by_shadowpriest-d4g28of.jpg', :password =>'whytepassword', :password_confirmation =>'whytepassword', :is_admin => true)
u2 = User.create(:username => 'quma', :avatar => 'https://cdn2.content.compendiumblog.com/uploads/user/ab04c84c-11a5-40cf-a34e-fd5aba218b07/52243708-9b44-409d-90ac-e87aa75ff8cd/Image/374bdf821ff36f60c9f2e3e15bc41679/screen_shot_2012_01_17_at_1_32_12_pm_w640.png', :password =>'qumapassword', :password_confirmation =>'qumapassword')
