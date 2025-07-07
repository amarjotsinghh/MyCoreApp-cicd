# Use the official .NET SDK image to build and publish the app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# Copy the rest of the source code
COPY . ./
RUN dotnet publish -c Release -o out

# Use the ASP.NET runtime image for the final container
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/out .

# Expose port (if it's a web app)
EXPOSE 80

# Start the app
ENTRYPOINT ["dotnet", "MyCoreApp.dll"]
