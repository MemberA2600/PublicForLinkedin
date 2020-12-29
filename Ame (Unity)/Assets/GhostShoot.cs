using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class GhostShoot : MonoBehaviour
{
    public SpriteRenderer render;
    public Sprite[] sprites;
    public AudioSource aud;
    public AudioClip[] clips;
    public int direction;
    float counter;
    int speed;
    int spriteIndex;

    // Start is called before the first frame update

    void Awake()
    {
        render = GetComponent<SpriteRenderer>();
        aud = GetComponent<AudioSource>();
    }
    void Start()
    {
        aud.clip = clips[Random.Range(0,3)];
        aud.Play();
        render.sprite = sprites[(int)Random.Range(0, sprites.Length)];

    }

    // Update is called once per frame
    void Update()
    {
        if (counter<100){
            counter += 0.05f;
            speed = 3;
        }
        else
        {
            speed = 1;
        }

        switch (direction)
        {
            case 0:
                transform.position -= new Vector3(0, speed * 2 * Time.deltaTime, 0);
                break;
            case 1:
                transform.position -= new Vector3(0, speed * Time.deltaTime, 0);
                transform.position += new Vector3(speed * Time.deltaTime, 0, 0);
                break;
            case 2:
                transform.position -= new Vector3(0, speed * Time.deltaTime, 0);
                transform.position -= new Vector3(speed * Time.deltaTime, 0, 0);
                break;
        }

        /*
        if (spriteIndex < sprites.Length - 1)
        {
            spriteIndex++;
        }
        else
        {
            spriteIndex = 0;
        }
         */

    }



     void OnBecameInvisible() 
     {
        Destroy(gameObject);
     }
}
