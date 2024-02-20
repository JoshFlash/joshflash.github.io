using System;
using System.Collections;
using System.Collections.Generic;
using Nova;
using UnityEngine;

public class AutoScroller : MonoBehaviour
{
    [SerializeField] private float scrollSpeed = 20f;
    
    private Scroller scroller = default;
    private bool _started = false;
    
    private void Start()
    {
        scroller = GetComponent<Scroller>();
        scroller.GetComponent<UIBlock2D>().AutoLayout.Offset = -300f;
        StartCoroutine(StartAfterSeconds(0.25f));
    }

    private IEnumerator StartAfterSeconds(float delay)
    {
        var timer = 0f;
        while (delay > timer)
        {
            timer += Time.deltaTime;
            yield return null;
        }

        _started = true;
    }

    private void Update()
    {
        if (!_started)
            return;
        if (scroller.TrackedVelocity * scroller.TrackedVelocity < 0.0001)
        {
            scroller.Scroll(-scrollSpeed * Time.deltaTime);
            if (scroller.OverScrolledRight())
                scroller.GetComponent<UIBlock2D>().AutoLayout.Offset = -3230f;
        }
    }
}
