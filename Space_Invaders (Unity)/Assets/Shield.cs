using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Shield : MonoBehaviour
{


    public int hp;
    public SpriteRenderer sr;

    // Start is called before the first frame update
    void Start()
    {
        sr = GetComponent<SpriteRenderer>();
        hp = 5;
        if (GameObject.Find("back").GetComponent<Manage_Enemies>().Shields.IndexOf(gameObject) % 2 == 0)
        {
            sr.flipX = true;
        }


        
    }

    // Update is called once per frame
    void Update()
    {
        if (hp == 0)
        {

            GameObject.Find("back").GetComponent<Manage_Enemies>().Shields.Remove(gameObject);
            Destroy(gameObject);

        }
    }

}
