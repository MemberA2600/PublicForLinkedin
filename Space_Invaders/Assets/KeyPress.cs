using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class KeyPress : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.anyKeyDown)
        {
            StartCoroutine(Load_Game());
        }
    }

    IEnumerator Load_Game()
    {
        AsyncOperation load = SceneManager.LoadSceneAsync("Game");
        while (!load.isDone)
        {
            print(load.progress);
            yield return null;
        }

    }
}
