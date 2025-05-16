// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fox_blasterEffectDown

package 
{
    import flash.display.MovieClip;

    public dynamic class fox_blasterEffectDown extends MovieClip 
    {

        public function fox_blasterEffectDown()
        {
            addFrameScript(6, this.frame7);
        }

        internal function frame7():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

