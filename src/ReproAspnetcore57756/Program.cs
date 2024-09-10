var builder = WebApplication
    .CreateSlimBuilder(args);

var app = builder.Build();

app.UseBlazorFrameworkFiles();
app.MapStaticAssets();

await app.RunAsync();
