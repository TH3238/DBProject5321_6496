import requests
import os

# GitHub Personal Access Token
# Replace 'your_token_here' with your actual GitHub token
GITHUB_TOKEN = os.getenv('GITHUB_TOKEN', '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')


def grant_github_access(user, repo):
    try:
        # Construct the URL to add collaborator using GitHub REST API
        url = f'https://api.github.com/repos/{repo}/collaborators/{user}'

        # Headers with GitHub token for authentication
        headers = {
            'Authorization': f'token {GITHUB_TOKEN}',
            'Accept': 'application/vnd.github.v3+json'
        }

        # Make PUT request to add collaborator
        response = requests.put(url, headers=headers)
        response_data = response.json() if response.content else {}

        if response.status_code == 201:
            return {'status': 'success', 'message': f'Collaborator {user} added to {repo}'}
        if response.status_code == 204:
            return {'status': 'error', 'message': f' {user} is already a Collaborator in {repo}'}
        elif response.status_code == 404:
            return {'status': 'error', 'message': f'Repository {repo} not found'}
        elif response.status_code == 403:
            return {'status': 'error', 'message': f'Permission denied: {response_data.get("message")}'}
        elif response.status_code == 422:
            return {'status': 'error', 'message': f'Validation failed: {response_data.get("message")}'}
        else:
            return {'status': 'error',
                    'message': f'Failed to add collaborator: {response_data.get("message", "Unknown error")}'}

    except requests.RequestException as e:
        return {'status': 'error', 'message': f'Request failed: {str(e)}'}


def main():
    # Example inputs (replace with your logic to get user input)
    user = input("Enter GitHub username: ")
    repo = input("Enter repository (owner/repository): ")

    # Grant GitHub access
    github_response = grant_github_access(user, repo)
    print(github_response)


if _name_ == '_main_':
    main()