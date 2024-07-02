// Function to toggle between sections (manage_posts and manage_ads)
function toggleSection(sectionId) {
    const managePosts = document.getElementById('manage_posts');
    const manageAds = document.getElementById('manage_ads');
            
    if (sectionId === 'manage_posts') {
        managePosts.style.display = 'block';
        manageAds.style.display = 'none';
    } else if (sectionId === 'manage_ads') {
        managePosts.style.display = 'none';
        manageAds.style.display = 'block';
    }
}
