class Subscription < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  after_create :send_receipt_email

  private
    def send_receipt_email
      @user = User.find_by_email(self.user.email)

      MyMailer.new_receipt(@user).deliver
    end
end
