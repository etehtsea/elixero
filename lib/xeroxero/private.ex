defmodule XeroXero.Private do

  def find(access_token, resource, api_type) do
    url = XeroXero.Utils.Urls.api(resource, api_type)

    header = XeroXero.Utils.Oauth.create_auth_header("GET", url, [oauth_token: access_token["oauth_token"]])
    XeroXero.Utils.Http.get(url, header)
  end

  def find(access_token, resource, api_type, query_filters, extra_headers) do
    url = XeroXero.Utils.Urls.api(resource, api_type) |> XeroXero.Utils.Urls.append_query_filters(query_filters)

    header = XeroXero.Utils.Oauth.create_auth_header("GET", url, [oauth_token: access_token["oauth_token"]])
    XeroXero.Utils.Http.get(url, header, extra_headers)
  end

  def create(access_token, resource, api_type, data_map) do
    url = XeroXero.Utils.Urls.api(resource, api_type)

    method =
      case(api_type) do
        :core -> "PUT"
      end

    header = XeroXero.Utils.Oauth.create_auth_header(method, url, [oauth_token: access_token["oauth_token"]])

    case(method) do
      "PUT" -> XeroXero.Utils.Http.put(url, header, data_map)
    end
  end

  def update(access_token, resource, api_type, data_map) do
    url = XeroXero.Utils.Urls.api(resource, api_type)

    method =
      case(api_type) do
        :core -> "POST"
      end

    header = XeroXero.Utils.Oauth.create_auth_header(method, url, [oauth_token: access_token["oauth_token"]])

    case(method) do
      "POST" -> XeroXero.Utils.Http.post(url, header, data_map)
    end
  end

  def delete(access_token, resource, api_type) do
    url = XeroXero.Utils.Urls.api(resource, api_type)

    header = XeroXero.Utils.Oauth.create_auth_header("DELETE", url, [oauth_token: access_token["oauth_token"]])

    XeroXero.Utils.Http.delete(url, header)
  end

  def upload_multipart(access_token, resource, api_type, path_to_file, name) do
    url = XeroXero.Utils.Urls.api(resource, api_type)

    header = XeroXero.Utils.Oauth.create_auth_header("POST", url, [oauth_token: access_token["oauth_token"]])

    XeroXero.Utils.Http.post_multipart(url, header, path_to_file, name)
  end

  def upload_attachment(access_token, resource, api_type, path_to_file, filename, include_online) do
    url = XeroXero.Utils.Urls.api(resource, api_type)
    url_for_signing = url <> "/" <> String.replace(filename, " ", "%20") <> "?includeonline=" <> ( if include_online, do: "true", else: "false") # Spaces must be %20 not +
    header = XeroXero.Utils.Oauth.create_auth_header("POST", url_for_signing, [oauth_token: access_token["oauth_token"]])

    url = url <> "/" <> URI.encode(filename, &URI.char_unreserved?(&1)) <> "?includeonline=" <> ( if include_online, do: "true", else: "false")
    XeroXero.Utils.Http.post_file(url, header, path_to_file)
  end
end
