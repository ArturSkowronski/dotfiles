import requests
from bs4 import BeautifulSoup

def find_rss_feed(url):
    try:
        response = requests.get(url)
        soup = BeautifulSoup(response.content, 'html.parser')

        # Look for RSS link in the HTML head
        link = soup.find("link", type="application/rss+xml")
        return link['href'] if link else None
    except Exception as e:
        print(f"Error fetching {url}: {e}")
        return None

# Replace with the actual list of blog URLs from the GitHub repository
blog_urls = [
    "http://example-blog1.com",
    "http://example-blog2.com",
    # ... other blog URLs ...
]

rss_feeds = {}
for url in blog_urls:
    rss_feed = find_rss_feed(url)
    if rss_feed:
        rss_feeds[url] = rss_feed

# Print or process the RSS feeds as needed
for blog, rss in rss_feeds.items():
    print(f"Blog: {blog}, RSS: {rss}")