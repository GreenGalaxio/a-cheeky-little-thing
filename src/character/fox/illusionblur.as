// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//illusionblur

package 
{
    import flash.display.MovieClip;

    public dynamic class illusionblur extends MovieClip 
    {

        public function illusionblur()
        {
            addFrameScript(8, this.frame9);
        }

        internal function frame9():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

