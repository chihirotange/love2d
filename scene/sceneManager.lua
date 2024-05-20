local SceneManager = {
    LoadScene = function(self, pathToScene)
        print(pathToScene)
        local sceneToLoad = require ("" .. pathToScene)
        sceneToLoad:LoadScene()
    end
}

return SceneManager