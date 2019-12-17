require "rails_helper"

describe User, type: :module do
  describe "User Validations" do
    it "valid with user attribute" do
      @user = User.new(
        name: "layth",
        email: "layth.jabbar@yahoo.com",
        password: "12345678",
        password_confirmation: "12345678",
      )
      @user.save!
      expect(@user).to be_valid
    end
    it "is not valid without a name" do
      @user = User.new(
        name: nil,
        email: "alca@yahoo.com",
        password: "password",
        password_confirmation: "password",
      )
      expect(@user).to_not be_valid
    end
    it "is not valid without an email" do
      @user = User.new(
        name: "layth",
        email: "alca@yahoo.com",
        password: nil,
        password_confirmation: "password",
      )
      expect(@user).to_not be_valid
    end
    it "is not valid without password confirmation" do
      @user = User.new(
        name: "layth",
        email: "alca@yahoo.com",
        password: "pasword",
        password_confirmation: nil,
      )
      expect(@user).to_not be_valid
    end
    it "is not valid without passwords matching" do
      @user = User.new(
        name: "layth",
        email: "alca@yahoo.com",
        password: "pasword",
        password_confirmation: "psaa",
      )
      expect(@user).to_not be_valid
    end
    it "is not valid without email" do
      @user = User.new(
        name: "layth",
        email: nil,
        password: "pasword",
        password_confirmation: "password",
      )
      expect(@user).to_not be_valid
    end
    it "is not valid if the email is already exist" do
      @user = User.new(
        name: "layth",
        email: "layth.jabbar@yahoo.com",
        password: "12345678",
        password_confirmation: "12345678",
      )
      @user.save!
      @user1 = User.create(
        name: "layth",
        email: "layth.jabbar@yahoo.com",
        password: "12345678",
        password_confirmation: "12345678",
      )
      expect(@user1).to_not be_valid
    end
    it "is valid if email contain spaces" do
      @user = User.create(
        name: "layth",
        email: "    layth.jabbar@yahoo.com",
        password: "12345678",
        password_confirmation: "12345678",
      )
      expect(@user).to be_valid
    end

    it "is valid with an email that has preceding spaces and case insestive" do
      @user = User.create(
        name: "layth",
        email: "layth.jabbar@yahoo.com",
        password: "12345678",
        password_confirmation: "12345678",
      )
      @user.save!

      login = @user.authenticate_with_credentials("    Layth.jabbar@yahoo.com", @user.password)
      expect(login).to be_truthy
    end
    it "is not valid if password has less than 8 numbers" do
      @user = User.create(
        name: "layth",
        email: "layth.jabbar@yahoo.com",
        password: "1234",
        password_confirmation: "1234",
      )
      expect(@user).to_not be_valid
    end
    it "is not valid if it's logged with incorrect password" do
      @user = User.new(
        name: "layth",
        email: "layth.jabbar@yahoo.com",
        password: "12345678",
        password_confirmation: "12345678",
      )
      @user.save!
      login = @user.authenticate_with_credentials("wrong@email", "wrongpassword")
      expect(login).to_not be_truthy
    end
    it ("is valid if logging with unmatching case") do
      @user = User.new(
        name: "Layth",
        email: "layth.jabbar@yahoo.com",
        password: "lalalala",
        password_confirmation: "lalalala",
      )
      @user.save!
      login = @user.authenticate_with_credentials("LAYTH.JABBAR@YAHOO.COM", @user.password)
      expect(login).to be_truthy
    end
  end
end
