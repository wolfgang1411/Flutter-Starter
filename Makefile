start:
	flutter run

build:
	flutter build apk

clean:
	flutter clean && flutter pub get

gen:
	dart run build_runner build --delete-conflicting-outputs
