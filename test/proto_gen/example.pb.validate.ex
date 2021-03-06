defmodule ProtoValidator.Gen.Examplepb.User do
  @moduledoc false
  use ProtoValidator, entity: Examplepb.User

  validate(:id, type: :uint64, required: true, uint64: [gt: 0, lt: 90])
  validate(:email, type: :string, required: true)
  validate(:gender, type: Examplepb.Gender)
  validate(:phones, type: {:repeated, Examplepb.User.Phone}, repeated: [min_items: 1])

  validate(:following_ids,
    type: {:repeated, :uint64},
    repeated: [items: [uint64: [gt: 0, lt: 90]], min_items: 0, unique: true]
  )
end

defmodule ProtoValidator.Gen.Examplepb.User.Phone do
  @moduledoc false
  use ProtoValidator, entity: Examplepb.User.Phone

  validate(:phone_number, type: :uint64, required: true, uint64: [gt: 1000, lt: 2000])
end
