protocol CodeView {
  func buildViewHierarchy()
  func setupConstraints()
  func setupAdditionalConfiguration()
  func setupViews()
}

extension CodeView {
  func setupViews() {
    buildViewHierarchy()
    setupConstraints()
    setupAdditionalConfiguration()
  }

  func setupAdditionalConfiguration() {}
}