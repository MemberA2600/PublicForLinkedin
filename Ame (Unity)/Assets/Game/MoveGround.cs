using System.Collections;
using System.Collections.Generic;
using UnityEngine;



public class MoveGround : MonoBehaviour
{
    public SpriteRenderer render;
    public GameObject Controller;

    void Awake()
    {
        render = GetComponent<SpriteRenderer>();
        Controller = GameObject.Find("SceneController");
    }

    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {

        if (transform.position.y < -9.99)
        {

            transform.position = new Vector3(transform.position.x, 10, 0);
        }
        else
        {
            transform.position -= new Vector3(0, (float)0.5 * Time.deltaTime, 0);
        }

    }
}
