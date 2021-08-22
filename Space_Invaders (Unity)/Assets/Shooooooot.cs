using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Shooooooot : MonoBehaviour
{
    public AudioClip[] Sounds;
    public AudioSource audio;

    // Start is called before the first frame update
    void Start()
    {
        audio = GetComponent<AudioSource>();
        audio.PlayOneShot(Sounds[0]);
    }

    // Update is called once per frame
    void Update()
    {


        if (Camera.current.WorldToScreenPoint(transform.position).y > Screen.height)
        {
            GameObject.Find("Player").GetComponent<Movement>().shoot = false;
            Destroy(gameObject);
        }
        else
        {
            transform.position -= new Vector3(0, -10 * Time.deltaTime, 0);
        }
    }
}
