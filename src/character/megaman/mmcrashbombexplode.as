// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//mmcrashbombexplode

package 
{
    import flash.display.MovieClip;

    public dynamic class mmcrashbombexplode extends MovieClip 
    {

        public function mmcrashbombexplode()
        {
            addFrameScript(21, this.frame22);
        }

        internal function frame22():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

