using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class CreateGround : MonoBehaviour
{
    public bool createNew = true;
    public bool flipY = false;

    // Start is called before the first frame update
    void Awake()
    {
        try
        {
            SceneManager.UnloadSceneAsync("Title");
        }
        catch
        {
            //
        }

    }

    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        /*
        if (createNew == true)
        {
            GameObject preFab = (GameObject)Resources.Load("grass");

            GameObject LastObject = Instantiate(preFab, new Vector3(0, 2, 0), Quaternion.identity);
            if (flipY == true) LastObject.GetComponent<MoveGround>().render.flipY = true;

            createNew = false;
            flipY = !flipY;
        } */
    }
}
