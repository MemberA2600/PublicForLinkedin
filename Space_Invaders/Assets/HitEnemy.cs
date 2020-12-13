using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HitEnemy : MonoBehaviour
{
    private bool Hit;

    // Start is called before the first frame update
    void Start()
    {
        Hit = false;
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void OnCollisionEnter2D(Collision2D col)
    {
        if (Hit == false)
        {

            if (GameObject.Find("back").GetComponent<Manage_Enemies>().enemies.Contains(col.gameObject))
            {
                Hit = true;
                col.gameObject.GetComponent<My_Sprite>().turn = false;
                col.gameObject.GetComponent<My_Sprite>().dead = true;
                GameObject.Find("Player").GetComponent<Movement>().shoot = false;
                GameObject.Find("back").GetComponent<Manage_Enemies>().enemies.Remove(col.gameObject);
                //Debug.Log(GameObject.Find("Back").GetComponent<Manage_Enemies>().enemies.Count);
                GameObject.Find("Player").GetComponent<Movement>().points += 100;
                Destroy(gameObject);
            }

            if (GameObject.Find("back").GetComponent<Manage_Enemies>().Shields.Contains(col.gameObject))
            {
                Hit = true;

                col.gameObject.GetComponent<Shield>().hp--;
                GameObject.Find("Player").GetComponent<Movement>().shoot = false;
                //Debug.Log(GameObject.Find("Back").GetComponent<Manage_Enemies>().enemies.Count);
                Destroy(gameObject);
            }


        }
    }

}
