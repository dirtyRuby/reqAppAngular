module AlreadyExists
  extend ActiveSupport::Concern

  def already_exists trap_id
    already_exists = false
    already_exists = true if Trap.find_by(name: trap_id)
    already_exists
  end

end