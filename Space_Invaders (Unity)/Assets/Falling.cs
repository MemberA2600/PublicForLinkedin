using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Falling : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        transform.position -= new Vector3(0, 5*Time.deltaTime,0);
        if (Camera.current.WorldToScreenPoint(transform.position).y < 5)
        {
            GameObject.Find("back").GetComponent<RandomShoot>().shootNumber--;
            Destroy(gameObject);

        }

    }

    void OnCollisionEnter2D(Collision2D col)
    {
        if (col.gameObject == GameObject.Find("Player"))
        {

            col.gameObject.GetComponent<Movement>().dead = true;
            col.gameObject.GetComponent<Movement>().aus.PlayOneShot(col.gameObject.GetComponent<Movement>().Clips[0]);
            
            GameObject.Find("back").GetComponent<RandomShoot>().shootNumber--;
            Destroy(gameObject);


        }

        if (GameObject.Find("back").GetComponent<Manage_Enemies>().Shields.Contains(col.gameObject))
        {
            col.gameObject.GetComponent<Shield>().hp--;
            GameObject.Find("back").GetComponent<RandomShoot>().shootNumber--;
            Destroy(gameObject);
        }
    }
}
