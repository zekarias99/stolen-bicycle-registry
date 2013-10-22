require 'spec_helper'

describe User do
  it { should respond_to :first_name }
  it { should respond_to :first_name_public }
  it { should respond_to :last_name }
  it { should respond_to :last_name_public }
  it { should respond_to :email }
  it { should respond_to :email_public }
  it { should respond_to :country }
  it { should respond_to :city }
  it { should respond_to :region }
  it { should respond_to :postal_code }
  it { should respond_to :phone1 }
  it { should respond_to :phone2 }
  it { should respond_to :encrypted_password }

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :country }
  it { should validate_presence_of :city }
  it { should validate_presence_of :region }
  it { should validate_presence_of :postal_code }
  it { should validate_presence_of :email }
  it { should validate_presence_of :encrypted_password}

  it { should validate_uniqueness_of :email }
  it { should have_many :bicycles }

  it "should set 'first_name_public' to true if the user checks the box on sign up/update" do
    user = FactoryGirl.create(:american_user, first_name_public: '0')
    user.first_name_public.should be false
    user.update(first_name_public: '1')
    user.first_name_public.should be true
  end

  it "should set 'last_name_public' to true if the user checks the box on sign up/update" do
    user = FactoryGirl.create(:american_user, last_name_public: '0')
    user.last_name_public.should be false
    user.update(last_name_public: '1')
    user.last_name_public.should be true
  end

  it "should set 'email_public' to true if the user checks the box on sign up" do
    user = FactoryGirl.create(:american_user, email_public: '0')
    user.email_public.should be false
    user.update(email_public: '1')
    user.email_public.should be true
  end

  describe "Canadian address verification" do
    it 'ensures that the selected region is a valid Canadian province' do
      user = FactoryGirl.build(:canadian_user) 
      user.should ensure_inclusion_of(:region).in_array(Geography::PROVINCES)
    end

    it 'allows postal codes of Canadian postal code format' do
      user = FactoryGirl.build(:canadian_user) 
      user.should allow_value("R0J 0A0").for(:postal_code) 
    end

    it 'doesn\'t allow postals codes that are not of Canadian postal code format' do
      user = FactoryGirl.build(:canadian_user)
      user.should_not allow_value("5555").for(:postal_code) 
    end
  end

  describe "American address verification" do      
    it 'ensures that the selected region is a valid U.S. state' do
      user = FactoryGirl.build(:american_user)
      user.should ensure_inclusion_of(:region).in_array(Geography::STATES) 
    end

    it 'allows postal codes of U.S. zip code format' do
      user = FactoryGirl.build(:american_user)
      user.should allow_value("55555").for(:postal_code) 
    end

    it 'doesn\'t allow postals codes that are not of U.S. zip code format' do
      user = FactoryGirl.build(:american_user)
      user.should_not allow_value("5555").for(:postal_code) 
    end
  end
end

#fixme add tests for in_us? and in_canada?