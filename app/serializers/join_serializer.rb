class JoinSerializer < ActiveModel::Serializer
  attributes :id, :host_id, :user_id, :joined, :declined
end
