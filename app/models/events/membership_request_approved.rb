class Events::MembershipRequestApproved < Event

  def self.publish!(membership, approver)
    create(kind: "membership_request_approved",
           user: approver,
           eventable: membership).tap { |e| Loomio::EventBus.broadcast('membership_request_approved_event', membership.user, e) }
  end

  def membership
    eventable
  end

  def group
    membership.group
  end
end
