# ------------------------------------------------------------
# build.R — Automated build and image sync for Bookdown
# ------------------------------------------------------------

# 1️⃣ Ensure the docs/images folder exists
if (dir.exists("images")) {
  dir.create("docs/images", showWarnings = FALSE, recursive = TRUE)
  file.copy(list.files("images", full.names = TRUE), "docs/images", overwrite = TRUE)
  message("✅ Copied all images to docs/images/")
} else {
  message("⚠️ No local 'images' folder found. Skipping image copy.")
}

# 2️⃣ Render the book
message("📘 Building Bookdown project...")
bookdown::render_book("index.Rmd")

# 3️⃣ Optional: print a success message
message("🎉 Build complete! Now you can commit and push to GitHub.")
