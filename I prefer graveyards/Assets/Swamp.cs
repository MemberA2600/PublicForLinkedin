using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Swamp : MonoBehaviour
{
    public AudioSource aud;
    public AudioClip swamp;

    void Awake()
    {
        aud = GetComponent<AudioSource>();
        aud.loop = true;
        aud.volume = 0.10f;
        aud.clip = swamp;
        aud.Play();
    }

    // Start is called before the first frame update
    void Start()
    {


    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
