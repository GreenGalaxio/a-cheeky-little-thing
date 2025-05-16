// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fox_blasterEffect

package 
{
    import flash.display.MovieClip;

    public dynamic class fox_blasterEffect extends MovieClip 
    {

        public function fox_blasterEffect()
        {
            addFrameScript(9, this.frame10);
        }

        internal function frame10():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

