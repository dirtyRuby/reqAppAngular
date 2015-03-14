module CaptureRequestsHelpers

  def already_exists
    already_exists = false
    already_exists = true if Trap.find_by("trap_id = ?", params[:trap_id])
    already_exists
  end


end