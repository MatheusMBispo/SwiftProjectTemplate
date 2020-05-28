setup: dependencies assets project

dependencies:
	carthage update --platform iOS
	# SwiftGen dependency
	brew install libxml2
	mint bootstrap

project: mock secrets kill_xcode
	mint run xcodegen
	open *.xcodeproj

clean: kill_xcode
	rm -r -f Carthage/
	rm -r -f *.xcodeproj

kill_xcode:
	killall Xcode || true
	killall Simulator || true

secrets:
	mint run swiftsecrets generate -f 128 --config secrets.yml

TEMPLATES_DIR = Templates
SOURCE_DIR = Sources
TEST_DIR = Tests

assets:
	mint run swiftgen

mock:
	sourcery --sources Sources/ --templates Templates/Mock --output Tests/Mock/

feature:
	mint run genesis generate ${TEMPLATES_DIR}/Feature/feature.yml --options "DIR:${SOURCE_DIR}, TEST_DIR:${TEST_DIR}, name:$(NAME) " 
	make mock
	make project

service:
	mint run genesis generate ${TEMPLATES_DIR}/Service/service.yml --options "DIR:${SOURCE_DIR}, TEST_DIR:${TEST_DIR}"
	make mock
	make project