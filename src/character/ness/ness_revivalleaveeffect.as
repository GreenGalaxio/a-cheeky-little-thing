// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_revivalleaveeffect

package 
{
    import flash.display.MovieClip;

    public dynamic class ness_revivalleaveeffect extends MovieClip 
    {

        public function ness_revivalleaveeffect()
        {
            addFrameScript(101, this.frame102);
        }

        internal function frame102():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

