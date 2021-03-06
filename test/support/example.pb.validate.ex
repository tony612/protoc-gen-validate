defmodule ProtoValidator.Gen.Examplepb.User do
  @moduledoc false
  use ProtoValidator, entity: Examplepb.User

  validate(:id, required: true, uint64: [gt: 0, lt: 90])
  validate(:email, required: true)
  validate(:phones, repeated: [min_items: 0])

  validate(:following_ids,
    repeated: [items: [uint64: [gt: 0, lt: 90]], min_items: 0, unique: true]
  )
end

defmodule ProtoValidator.Gen.Examplepb.User.Phone do
  @moduledoc false
  use ProtoValidator, entity: Examplepb.User.Phone

  validate(:phone_number, required: true, uint64: [gt: 10_000_000_000, lt: 20_000_000_000])
end
