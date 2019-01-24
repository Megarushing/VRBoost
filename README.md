# VRBoost
Simple Batch Script to kill processes that hog memory and start SteamVR with high priority

# Functionality
There is nothing more important to VR than low latency, some processes running in the background may steal some of the precious CPU  and memory resources from time to time. After growning tired of closing each background process manually I have made this script.

# How it works
This script will kill all non-whitelisted apps before starting VR, this avoids background processes hogging memory in order to get a smoother VR experience, it will also prioritize the steamVR process on start.

I have noticed significant inprovements with this on my mid range PC so I am releasing it for anyone who may be in the same situation.

# Versions
The best version will request admin privileges before starting to kill processes, this allows it to end more processes than previously capable, in case you do not have or do not want to use admin privileges there is also a NoAdmin version
