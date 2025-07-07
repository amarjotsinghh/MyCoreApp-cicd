# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

COPY *.csproj ./
RUN dotnet restore

COPY . ./
RUN dotnet publish -c Release -o /app/publish

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

COPY --from=build /app/publish .

# Important: set ASP.NET Core to listen on port 5109 (on all interfaces)
ENV ASPNETCORE_URLS=http://+:5109

EXPOSE 5109
ENTRYPOINT ["dotnet", "MyCoreApp.dll"]
