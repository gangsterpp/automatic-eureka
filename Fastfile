platform :android do
    lane :deploy do
      build_android
      firebase_app_distribution(
        app: "your_firebase_app_id",
        testers: "your_email@example.com",
        release_notes: "New build"
      )
    end
  end
