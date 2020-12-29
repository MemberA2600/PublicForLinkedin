using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DIE : MonoBehaviour
{

    public SpriteRenderer render;
    public Sprite[] sprites;
    public AudioSource aud;
    public AudioClip[] clips;
    

    // Start is called before the first frame update
    void Awake()
    {
        render = GetComponent<SpriteRenderer>();
        aud = GetComponent<AudioSource>();
    }

    void Start()
    {
        aud.clip = clips[Random.Range(0, 2)];
        aud.Play(); 
        StartCoroutine(Animation());
    }

    IEnumerator Animation()
    {
        for (int num = 0; num < sprites.Length - 1; num++)
        {
            render.sprite = sprites[num];

            yield return new WaitForSeconds(0.05f);
        }
        Destroy(gameObject);
    }

    // Update is called once per frame
    void Update()
    {
        transform.position -= new Vector3(0f, 0.4f * Time.deltaTime, 0);
    }
}
