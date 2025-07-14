return function(target: Instance)
	local TextLabel = Instance.new("TextLabel")
	TextLabel.Text = "Hello"
	TextLabel.TextScaled = true
	TextLabel.Size = UDim2.fromScale(0.5, 0.5)
	TextLabel.Position = UDim2.fromScale(0.5, 0.5)
	TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	TextLabel.Parent = target

	return function()
		TextLabel:Destroy()
	end
end
