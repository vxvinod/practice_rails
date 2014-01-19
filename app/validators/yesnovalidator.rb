class Yesnovalidator < ActiveModel::Validator

	def validate(record)
		if record.title.include?("yes") && record.description.include?("no")
			record.errors[:title] << "Title has yes word and description has no word"
		end

	end

end