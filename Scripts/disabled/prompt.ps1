# Prompt for cwd feature
# function prompt {
#   $loc = $executionContext.SessionState.Path.CurrentLocation;

#   $out = ""
#   if ($loc.Provider.Name -eq "FileSystem") {
#     $out += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
#   }
#   $out += "PS $loc$('>' * ($nestedPromptLevel + 1)) ";
#   return $out
# }


# Starship prompt is enabled so disable the above
function Invoke-Starship-PreCommand {
  $loc = $executionContext.SessionState.Path.CurrentLocation;
  $prompt = "$([char]27)]9;12$([char]7)"
  if ($loc.Provider.Name -eq "FileSystem") {
    $prompt += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
  }
  $host.ui.Write($prompt)
}